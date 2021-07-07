-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 06:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vue-project2`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogcategories`
--

CREATE TABLE `blogcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogcategories`
--

INSERT INTO `blogcategories` (`id`, `category_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(61, 2, 6, NULL, NULL),
(62, 2, 7, NULL, NULL),
(63, 3, 7, NULL, NULL),
(64, 2, 8, NULL, NULL),
(65, 3, 8, NULL, NULL),
(66, 4, 8, NULL, NULL),
(67, 5, 8, NULL, NULL),
(71, 3, 11, NULL, NULL),
(72, 5, 11, NULL, NULL),
(73, 5, 10, NULL, NULL),
(74, 2, 9, NULL, NULL),
(75, 3, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featuredImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `jsonData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `post`, `post_excerpt`, `slug`, `featuredImage`, `metaDescription`, `views`, `jsonData`, `created_at`, `updated_at`, `user_id`) VALUES
(6, 'Semi', '<div class=\"blog_image\">\n                                <img src=\"http://127.0.0.1:8000/uploads/1625055687.png\" alt=\"\"/>\n                                \n                        </div><p class=\"blog_post_text\">\n                        Supervised learning has been at the forefront of research in computer vision and deep learning over the past decade.    \n                    </p><p class=\"blog_post_text\">\n                        In a supervised learning setting, humans are required to annotate a large amount of dataset manually. Then, models use this data to learn complex underlying relationships between the data and label and develop the capability to predict the label, given the data. Deep learning models are generally data-hungry and require enormous amounts of datasets to achieve good performance. Ever-improving hardware and the availability of large human-labeled datasets has been the reason for the recent successes of deep learning.    \n                    </p><div class=\"spcl_line mar_b30\">\n                        <blockquote>\n                            <p class=\"spcl_line_p\">\n                                If you think of gaining a new skill only as a means to a very specific end (i.e., getting promoted), your first step should be to adjust your mindset. You need to embrace continuous learning as an integral part of your professional development—today and for the rest of your career.\n                            </p>\n                        </blockquote>\n                        <p>- </p>\n                    </div><p class=\"blog_post_text\">\n                        One major drawback of supervised deep learning is that it relies on the presence of an extensive amount of human-labeled datasets for training. This luxury is not available across all domains as it might be logistically difficult and very expensive to get huge datasets annotated by professionals. While the acquisition of labeled data can be a challenging and costly endeavor, we usually have access to large amounts of unlabeled datasets, especially image and text data. Therefore, we need to find a way to tap into these underused datasets and use them for learning.    \n                    </p><h2 class=\"blog_post_h2\">Transfer Learning from Pretrained Models</h2><p class=\"blog_post_text\">\n                        Transfer learning means using knowledge from a similar task to solve a problem at hand. In practice, it usually means using as initializations the deep neural network weights learned from a similar task, rather than starting from a random initialization of the weights, and then further training the model on the available labeled data to solve the task at hand.    \n                    </p><p class=\"blog_post_text\">\n                        Transfer learning enables us to train models on datasets as small as a few thousand examples, and it can deliver a very good performance. Transfer learning from pretrained models can be performed in three ways:    \n                    </p><h3 class=\"blog_post_h3\">1. Feature Extraction</h3><p class=\"blog_post_text\">\n                        Usually, the last layers of the neural network are doing the most abstract and task-specific calculations, which are generally not easily transferable to other tasks. By contrast, the initial layers of the network learn some basic features like edges and common shapes, which are easily transferable across tasks.    \n                    </p><p class=\"blog_post_text\">\n                        The image sets below depict what the convolution kernels at different levels in a convolutional neural network (CNN) are essentially learning. We see a hierarchical representation, with the initial layers learning basic shapes, and progressively, higher layers learning more complex semantic concepts.    \n                    </p><h3 class=\"blog_post_h3\">2. Fine-tuning</h3><p class=\"blog_post_text\">\n                        Alternatively, we can transfer the layers from a pretrained network and train the entire network on the available labeled data. This setup needs a little more labeled data because you are training the entire network and hence a large number of parameters. This setup is more prone to overfitting when there is a scarcity of data.    \n                    </p><h3 class=\"blog_post_h3\">3. Two-stage Transfer Learning</h3><p class=\"blog_post_text\">\n                        This approach is my personal favorite and usually yields the best results, at least in my experience. Here, we train the newly attached layers while freezing the transferred layers for a few epochs before fine-tuning the entire network.    \n                    </p><h2 class=\"blog_post_h2\">The Need for Semi-supervised and Unsupervised Methods</h2><p class=\"blog_post_text\">\n                        This usually works very well for most image classification tasks because we have huge image datasets like ImageNet that cover a good portion of possible image space—and usually, weights learned from it are transferable to custom image classification tasks. Moreover, the pretrained networks are readily available off the shelf, thus facilitating the process.    \n                    </p><p class=\"blog_post_text\">\n                        However, this approach will not work well if the distribution of images in your task is drastically different from the images that the base network was trained on. For example, if you are dealing with grayscale images generated by a medical imaging device, transfer learning from ImageNet weights will not be that effective and you will need more than a couple of thousand labeled images for training your network to satisfactory performance.    \n                    </p><h2 class=\"blog_post_h2\">Experiment</h2><p class=\"blog_post_text\">\n                        In this section, I will relate an experiment that empirically establishes the potential of unsupervised pre-training for image classification. This was my semester project for a Deep Learning class I took with Yann LeCun at NYU last spring.    \n                    </p><ul class=\"blog_post_ul\">\n                            <li>Dataset. It is composed of 128K labeled examples, half of which are for training and the other half for validation. Furthermore, we are provided 512K unlabeled images. The data contains 1,000 classes in total.</li><li>Unsupervised pre-training. AlexNet was trained for rotation classification using extensive data augmentation for 63 epochs. We used the hyperparameters documented by Rotnet in their paper.</li><li>Classifier training. Features were extracted from the fourth convolution layer, and three fully connected layers were appended to it. These layers were randomly initialized and trained with a scheduled decreasing learning rate, and early stopping was implemented to stop training.</li>\n                        </ul>', 'Supervised learning has been at the forefront of research in computer vision and deep learning over the past decade.', 'Semi', NULL, 'Supervised learning has been at the forefront of research in computer vision and deep learning over the past decade.', 0, '{\"time\":1625603027920,\"blocks\":[{\"id\":\"gwzUjQ-lQ3\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://127.0.0.1:8000/uploads/1625055687.png\"},\"caption\":\"\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}},{\"id\":\"_Tn5_hJzbN\",\"type\":\"paragraph\",\"data\":{\"text\":\"Supervised learning has been at the forefront of research in computer vision and deep learning over the past decade.\"}},{\"id\":\"gxkPw27xED\",\"type\":\"paragraph\",\"data\":{\"text\":\"In a supervised learning setting, humans are required to annotate a large amount of dataset manually. Then, models use this data to learn complex underlying relationships between the data and label and develop the capability to predict the label, given the data. Deep learning models are generally data-hungry and require enormous amounts of datasets to achieve good performance. Ever-improving hardware and the availability of large human-labeled datasets has been the reason for the recent successes of deep learning.\"}},{\"id\":\"iDFSyoDl4y\",\"type\":\"quote\",\"data\":{\"text\":\"If you think of gaining a new skill only as a means to a very specific end (i.e., getting promoted), your first step should be to adjust your mindset. You need to embrace continuous learning as an integral part of your professional development—today and for the rest of your career.\",\"caption\":\"\",\"alignment\":\"left\"}},{\"id\":\"QAXNuKZ4cG\",\"type\":\"paragraph\",\"data\":{\"text\":\"One major drawback of supervised deep learning is that it relies on the presence of an extensive amount of human-labeled datasets for training. This luxury is not available across all domains as it might be logistically difficult and very expensive to get huge datasets annotated by professionals. While the acquisition of labeled data can be a challenging and costly endeavor, we usually have access to large amounts of unlabeled datasets, especially image and text data. Therefore, we need to find a way to tap into these underused datasets and use them for learning.\"}},{\"id\":\"xS-d5ZKct5\",\"type\":\"header\",\"data\":{\"text\":\"Transfer Learning from Pretrained Models\",\"level\":2}},{\"id\":\"iKlCrVJQsG\",\"type\":\"paragraph\",\"data\":{\"text\":\"Transfer learning means using knowledge from a similar task to solve a problem at hand. In practice, it usually means using as initializations the deep neural network weights learned from a similar task, rather than starting from a random initialization of the weights, and then further training the model on the available labeled data to solve the task at hand.\"}},{\"id\":\"BENT4eoPsF\",\"type\":\"paragraph\",\"data\":{\"text\":\"Transfer learning enables us to train models on datasets as small as a few thousand examples, and it can deliver a very good performance. Transfer learning from pretrained models can be performed in three ways:\"}},{\"id\":\"5qMVo3jGBY\",\"type\":\"header\",\"data\":{\"text\":\"1. Feature Extraction\",\"level\":3}},{\"id\":\"FxFpH8sNmv\",\"type\":\"paragraph\",\"data\":{\"text\":\"Usually, the last layers of the neural network are doing the most abstract and task-specific calculations, which are generally not easily transferable to other tasks. By contrast, the initial layers of the network learn some basic features like edges and common shapes, which are easily transferable across tasks.\"}},{\"id\":\"b7uPFZfz5g\",\"type\":\"paragraph\",\"data\":{\"text\":\"The image sets below depict what the convolution kernels at different levels in a convolutional neural network (CNN) are essentially learning. We see a hierarchical representation, with the initial layers learning basic shapes, and progressively, higher layers learning more complex semantic concepts.\"}},{\"id\":\"3LwgmHCLvp\",\"type\":\"header\",\"data\":{\"text\":\"2. Fine-tuning\",\"level\":3}},{\"id\":\"RK4bT40TBA\",\"type\":\"paragraph\",\"data\":{\"text\":\"Alternatively, we can transfer the layers from a pretrained network and train the entire network on the available labeled data. This setup needs a little more labeled data because you are training the entire network and hence a large number of parameters. This setup is more prone to overfitting when there is a scarcity of data.\"}},{\"id\":\"3nabzhAedB\",\"type\":\"header\",\"data\":{\"text\":\"3. Two-stage Transfer Learning\",\"level\":3}},{\"id\":\"QdzA7BFyla\",\"type\":\"paragraph\",\"data\":{\"text\":\"This approach is my personal favorite and usually yields the best results, at least in my experience. Here, we train the newly attached layers while freezing the transferred layers for a few epochs before fine-tuning the entire network.\"}},{\"id\":\"uqugYE0245\",\"type\":\"header\",\"data\":{\"text\":\"The Need for Semi-supervised and Unsupervised Methods\",\"level\":2}},{\"id\":\"1uvxt74_j0\",\"type\":\"paragraph\",\"data\":{\"text\":\"This usually works very well for most image classification tasks because we have huge image datasets like ImageNet that cover a good portion of possible image space—and usually, weights learned from it are transferable to custom image classification tasks. Moreover, the pretrained networks are readily available off the shelf, thus facilitating the process.\"}},{\"id\":\"CXVQfvFMNI\",\"type\":\"paragraph\",\"data\":{\"text\":\"However, this approach will not work well if the distribution of images in your task is drastically different from the images that the base network was trained on. For example, if you are dealing with grayscale images generated by a medical imaging device, transfer learning from ImageNet weights will not be that effective and you will need more than a couple of thousand labeled images for training your network to satisfactory performance.\"}},{\"id\":\"N-lhcdTTbq\",\"type\":\"header\",\"data\":{\"text\":\"Experiment\",\"level\":2}},{\"id\":\"AYr75TR4c9\",\"type\":\"paragraph\",\"data\":{\"text\":\"In this section, I will relate an experiment that empirically establishes the potential of unsupervised pre-training for image classification. This was my semester project for a Deep Learning class I took with Yann LeCun at NYU last spring.\"}},{\"id\":\"92x8shf2XB\",\"type\":\"list\",\"data\":{\"style\":\"unordered\",\"items\":[\"Dataset. It is composed of 128K labeled examples, half of which are for training and the other half for validation. Furthermore, we are provided 512K unlabeled images. The data contains 1,000 classes in total.\",\"Unsupervised pre-training. AlexNet was trained for rotation classification using extensive data augmentation for 63 epochs. We used the hyperparameters documented by Rotnet in their paper.\",\"Classifier training. Features were extracted from the fourth convolution layer, and three fully connected layers were appended to it. These layers were randomly initialized and trained with a scheduled decreasing learning rate, and early stopping was implemented to stop training.\"]}}],\"version\":\"2.22.0\"}', '2021-06-30 09:18:03', '2021-07-06 17:23:48', 1),
(7, 'Huawei', '<div class=\"blog_image\">\n                                <img src=\"http://127.0.0.1:8000/uploads/1625056216.jpg\" alt=\"\"/>\n                                \n                        </div><p class=\"blog_post_text\">\n                        Quite how Huawei’s colour stylists work to come up with its product finish details is tough to guess, but case finish notwithstanding, this a high-end product so if it came in pink you could expect its product details to list salmon, coral, fuschia or some other paint-shop fanciness.    \n                    </p>', 'Quite how Huawei’s colour stylists work to come up with its product finish details is tough to guess, but case finish notwithstanding, this a high-end product so if it came in pink you could expect its product details to list salmon, coral, fuschia or some other paint-shop fanciness.', 'Huawei', NULL, 'Quite how Huawei’s colour stylists work to come up with its product finish details is tough to guess, but case finish notwithstanding, this a high-end product so if it came in pink you could expect its product details to list salmon, coral, fuschia or some other paint-shop fanciness.', 0, '{\"time\":1625603036561,\"blocks\":[{\"id\":\"i0C0c92u3W\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://127.0.0.1:8000/uploads/1625056216.jpg\"},\"caption\":\"\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}},{\"id\":\"_nYOLM9Nbd\",\"type\":\"paragraph\",\"data\":{\"text\":\"Quite how Huawei’s colour stylists work to come up with its product finish details is tough to guess, but case finish notwithstanding, this a high-end product so if it came in pink you could expect its product details to list salmon, coral, fuschia or some other paint-shop fanciness.\"}}],\"version\":\"2.22.0\"}', '2021-06-30 09:30:59', '2021-07-06 17:23:57', 1),
(8, 'Cloud', '<p class=\"blog_post_text\">\n                        With growing adoption SaaS and public cloud IaaS, it’s no shocker that we’re getting an increasing number of calls about cloud networking. However, the tenor of these calls is actively shifting from purely “TO” the cloud (i.e., SD-WAN), to now also include networking “IN” the cloud.&nbsp; While we’ve covered this topic before (No Forklifts), client interest in cloud networking has increased dramatically (nearly 6X) in the past 12 months.    \n                    </p><p class=\"blog_post_text\">\n                        One of the reasons for this is that the native networking capabilities of public cloud providers are insufficient for some production enterprise workloads.&nbsp; Similarly, the virtual routers offered by established vendors don’t often meet requirements of cloud and DevOps teams, particularly around programmability, integration, or licensing. Further, the networking features and operational approaches vary widely across public cloud providers, which creates management challenges, particularly in multicloud deployments.    \n                    </p>', 'With growing adoption SaaS and public cloud IaaS, it’s no shocker that we’re getting an increasing number of calls about cloud networking.', 'Cloud', NULL, 'IT', 0, '{\"time\":1625603044559,\"blocks\":[{\"id\":\"M1fr7kDpSd\",\"type\":\"paragraph\",\"data\":{\"text\":\"With growing adoption SaaS and public cloud IaaS, it’s no shocker that we’re getting an increasing number of calls about cloud networking. However, the tenor of these calls is actively shifting from purely “TO” the cloud (i.e., SD-WAN), to now also include networking “IN” the cloud.&nbsp; While we’ve covered this topic before (No Forklifts), client interest in cloud networking has increased dramatically (nearly 6X) in the past 12 months.\"}},{\"id\":\"-shFH3Mcl0\",\"type\":\"paragraph\",\"data\":{\"text\":\"One of the reasons for this is that the native networking capabilities of public cloud providers are insufficient for some production enterprise workloads.&nbsp; Similarly, the virtual routers offered by established vendors don’t often meet requirements of cloud and DevOps teams, particularly around programmability, integration, or licensing. Further, the networking features and operational approaches vary widely across public cloud providers, which creates management challenges, particularly in multicloud deployments.\"}}],\"version\":\"2.22.0\"}', '2021-07-04 17:27:27', '2021-07-06 17:24:04', 1),
(9, 'IT Blog', '<p class=\"blog_post_text\">\n                        It Blog    \n                    </p>', 'It Blog', 'IT Blog', NULL, 'It Blog', 0, '{\"time\":1625605874383,\"blocks\":[{\"id\":\"nb5D9Jf-vE\",\"type\":\"paragraph\",\"data\":{\"text\":\"It Blog\"}}],\"version\":\"2.22.0\"}', '2021-07-06 18:09:24', '2021-07-06 18:11:14', 1),
(10, 'Medical', '<p class=\"blog_post_text\">\n                        Medical blog    \n                    </p>', 'Medical blog', 'Medical', NULL, 'Medical blog', 0, '{\"time\":1625605859598,\"blocks\":[{\"id\":\"tDbAOicPaD\",\"type\":\"paragraph\",\"data\":{\"text\":\"Medical blog\"}}],\"version\":\"2.22.0\"}', '2021-07-06 18:09:52', '2021-07-06 18:10:59', 1),
(11, 'Space', '<p class=\"blog_post_text\">\n                        Space    \n                    </p>', 'Medical blog', 'space', NULL, 'Medical blog', 0, '{\"time\":1625605825376,\"blocks\":[{\"id\":\"0hlyWcLB8n\",\"type\":\"paragraph\",\"data\":{\"text\":\"Space\"}}],\"version\":\"2.22.0\"}', '2021-07-06 18:10:25', '2021-07-06 18:10:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogtags`
--

CREATE TABLE `blogtags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogtags`
--

INSERT INTO `blogtags` (`id`, `tag_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(85, 5, 6, NULL, NULL),
(86, 6, 6, NULL, NULL),
(87, 6, 7, NULL, NULL),
(88, 5, 8, NULL, NULL),
(89, 6, 8, NULL, NULL),
(90, 7, 8, NULL, NULL),
(91, 11, 8, NULL, NULL),
(92, 12, 8, NULL, NULL),
(96, 7, 11, NULL, NULL),
(97, 11, 11, NULL, NULL),
(98, 12, 11, NULL, NULL),
(99, 5, 11, NULL, NULL),
(100, 6, 10, NULL, NULL),
(101, 7, 9, NULL, NULL),
(102, 11, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iconImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryName`, `iconImage`, `created_at`, `updated_at`) VALUES
(2, 'IT', '/uploads/1624394114.jpg', '2021-06-22 17:35:16', '2021-06-27 09:42:31'),
(3, 'Science', '/uploads/1624394185.jpg', '2021-06-22 17:36:27', '2021-06-22 17:36:27'),
(4, 'Designers', '/uploads/1624794297.jpg', '2021-06-27 08:45:01', '2021-06-27 08:45:01'),
(5, 'Medical', '/uploads/1624824186.jpg', '2021-06-27 17:03:08', '2021-06-27 17:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_26_215144_create_categories_table', 1),
(5, '2021_04_26_215402_create_tags_table', 1),
(9, '2021_06_13_201721_create_roles_table', 1),
(10, '2021_04_26_215426_create_blogs_table', 2),
(11, '2021_04_26_215649_create_blogtags_table', 2),
(12, '2021_04_26_215914_create_blogcategories_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `permission`, `isAdmin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '[{\"resourceName\":\"Home\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"/\"},{\"resourceName\":\"Tags\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"tags\"},{\"resourceName\":\"Category\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"category\"},{\"resourceName\":\"Create blogs\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"createBlog\"},{\"resourceName\":\"Blogs\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"blogs\"},{\"resourceName\":\"Admin users\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"adminusers\"},{\"resourceName\":\"Role\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"role\"},{\"resourceName\":\"Assign Role\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"assignRole\"}]', 1, '2021-06-14 10:43:46', '2021-06-27 09:40:57'),
(2, 'User', '[{\"resourceName\":\"Home\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"/\"},{\"resourceName\":\"Tags\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"tags\"},{\"resourceName\":\"Category\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"category\"},{\"resourceName\":\"Admin users\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"adminusers\"},{\"resourceName\":\"Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"Assign Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignRole\"}]', 0, '2021-06-14 10:43:51', '2021-06-16 18:03:43'),
(3, 'Moderator', '[{\"resourceName\":\"Home\",\"read\":true,\"write\":true,\"update\":true,\"delete\":false,\"name\":\"/\"},{\"resourceName\":\"Tags\",\"read\":true,\"write\":true,\"update\":true,\"delete\":false,\"name\":\"tags\"},{\"resourceName\":\"Category\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"category\"},{\"resourceName\":\"Admin users\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"adminusers\"},{\"resourceName\":\"Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"Assign Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignRole\"}]', 0, '2021-06-14 10:43:58', '2021-06-16 11:30:45'),
(4, 'Editor', '[{\"resourceName\":\"Home\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"/\"},{\"resourceName\":\"Tags\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"tags\"},{\"resourceName\":\"Category\",\"read\":true,\"write\":true,\"update\":true,\"delete\":true,\"name\":\"category\"},{\"resourceName\":\"Admin users\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"adminusers\"},{\"resourceName\":\"Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"Assign Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignRole\"}]', 1, '2021-06-16 09:20:12', '2021-06-16 11:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tagName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tagName`, `created_at`, `updated_at`) VALUES
(5, 'php', '2021-06-22 17:34:04', '2021-06-22 17:34:04'),
(6, 'laravel', '2021-06-22 17:34:12', '2021-06-22 17:34:12'),
(7, 'html', '2021-06-23 09:38:38', '2021-06-23 09:38:38'),
(11, 'css', '2021-06-26 17:34:09', '2021-06-26 17:34:09'),
(12, 'vue', '2021-06-27 08:45:18', '2021-06-27 08:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profilePic` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/uploads/pic.png',
  `role_id` int(11) NOT NULL DEFAULT 1,
  `isActivated` tinyint(1) NOT NULL DEFAULT 0,
  `passwordResetCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activationCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `email`, `password`, `profilePic`, `role_id`, `isActivated`, `passwordResetCode`, `activationCode`, `socialType`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'zubair yousaf', 'zubair@qdimensions.com', '$2y$10$kJZdF1DSrPD.uEZfosNaJ.q0hFA51gpUgASGZDNcT6PxfhBKW4ZXq', '/img/pic.png', 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-06-14 10:39:25', '2021-06-14 17:47:28'),
(30, 'test user', 'test@test.com', '$2y$10$qTZf6j4WkWkCpg9faBIYZO2kDJXeEkLgsNDKzn4nmL8fL97zY.Jka', '/img/pic.png', 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-06-16 18:04:16', '2021-06-26 17:10:57'),
(31, 'admin', 'admin@gmail.com', '$2y$10$gwmzB0cNRhczUlY8WcmNaOl2xYkjH6SIOiSNiKwEcWfqrmiIlBvuy', '/img/pic.png', 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-07 11:08:15', '2021-07-07 11:08:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogcategories`
--
ALTER TABLE `blogcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogcategories_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `blogtags`
--
ALTER TABLE `blogtags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogtags_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogcategories`
--
ALTER TABLE `blogcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blogtags`
--
ALTER TABLE `blogtags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogcategories`
--
ALTER TABLE `blogcategories`
  ADD CONSTRAINT `blogcategories_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogtags`
--
ALTER TABLE `blogtags`
  ADD CONSTRAINT `blogtags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
