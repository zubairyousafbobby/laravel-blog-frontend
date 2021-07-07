<?php

namespace App\Http\Controllers;

//use Facade\FlareClient\View;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Blog;
use Illuminate\View\View;


class BlogController extends Controller
{
    //
    public function index(Request $request)
    {
        $categories = Category::all();
        $blogs = Blog::orderBy('id', 'desc')->with(['cat', 'user'])->limit(6)->get(['id', 'title', 'post_excerpt', 'slug', 'user_id', 'featuredImage', 'created_at']);
        // return $blogs;
        return view('home', ['categories' => $categories, 'blogs' => $blogs]);
    }

    public function blogSingle(Request $request, $slug)
    {
        // $categories = Category::select('id', 'categoryName')->get();
        // $blog = Blog::where('slug', $slug)->with('cat','tag','user')->first(['id', 'title', 'user_id', 'featuredImage','post']);
        // return view('blogsingle')->with(['categories' => $categories, 'blog' => $blog]);

        $blog = Blog::where('slug', $slug)->with('cat', 'tag', 'user')->first(['id', 'title', 'user_id', 'featuredImage', 'post']);
        $category_ids = [];
        foreach ($blog->cat as $cat) {
            array_push($category_ids, $cat->id);
        }

        $relatedBlogs = Blog::with('user')->where('id', '!=', $blog->id)->wherehas('cat', function ($q) use ($category_ids) {
            $q->whereIn('category_id', $category_ids);
        })->limit(5)->orderBy('id', 'desc')->get(['id', 'title', 'slug', 'user_id', 'featuredImage', 'created_at']);

        return view('blogsingle')->with(['blog' => $blog, 'relatedBlogs' => $relatedBlogs]);
    }

    public function compose(View $view)
    {
        $cat = Category::select('id', 'categoryName')->get(['id', 'categoryName']);
        $view->with('cat', $cat);
    }


    public function categoryIndex(Request $request, $categoryName, $id)
    {
        $blogs = Blog::with('user')->wherehas('cat', function ($q) use ($id) {
            $q->where('category_id', $id);
        })->orderBy('id', 'desc')->select('id', 'title', 'slug', 'user_id', 'featuredImage', 'created_at')->paginate(2);

        return view('category')->with(['blogs' => $blogs, 'categoryName' => $categoryName]);
    }

    public function tagIndex(Request $request, $tagName, $id)
    {
        $blogs = Blog::with('user')->wherehas('tag', function ($q) use ($id) {
            $q->where('tag_id', $id);
        })->orderBy('id', 'desc')->select('id', 'title', 'slug', 'user_id', 'featuredImage', 'created_at')->paginate(2);

        return view('tag')->with(['blogs' => $blogs, 'tagName' => $tagName]);
    }

    public function allBlogs(Request $request)
    {
        $blogs = Blog::orderBy('id', 'desc')->with(['cat', 'user'])->select('id', 'title', 'post_excerpt', 'slug', 'user_id', 'featuredImage', 'created_at')->paginate(10);
        return view('blogs', ['blogs' => $blogs]);
    }

    public function search(Request $request)
    {
        $str = $request->str;
        $blogs = Blog::orderBy('id', 'desc')->with(['cat', 'user'])->select('id', 'title', 'post_excerpt', 'slug', 'user_id', 'featuredImage', 'created_at');
        $blogs->when($str != '', function ($q) use ($str) {
            $q->where('title', 'LIKE', "%{$str}%")
                ->orWhereHas('cat', function ($q) use ($str) {
                    $q->where('categoryName', $str);
                })
                ->orWhereHas('tag', function ($q) use ($str) {
                    $q->where('tagName', $str);
                });
        });

        $blogs = $blogs->paginate(2);
        $blogs = $blogs->appends($request->all());
        return view('blogs', ['blogs' => $blogs]);


        // if(!$str)       
        //  return $blogs->get();

        //  $blogs->where('title', 'LIKE', "%{$str}%")
        //         ->orWhereHas('cat', function ($q) use($str){
        //             $q->where('categoryName', $str);
        //         })
        //         ->orWhereHas('tag', function ($q) use($str){
        //             $q->where('tagName', $str);
        //         });
        // return $blogs->get();
    }
}
