@extends('layout.app')
@section('title', 'tag Page')
@section('maincontent')

    <!-- BANNER -->
    <section class="banner_sec">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-10 col-lg-8">
                    <div class="row">
                                <div class="col-12 col-md-4 col-lg-4">
                                    <a href="">
                                        <div class="banner_box">
                                            <i class="fab fa-laravel"></i>
                                            <h3 class="banner_box_h3">{{$tagName }}</h3>
                                        </div>
                                    </a>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- BANNER -->

    <!-- BODY -->
    <div class="home_body">
        <div class="container">
            <div class="latest_post">
                <div class="latest_post_top">
                    <h1 class="latest_post_h1 brdr_line">{{$tagName}} Blogs</h1>
                </div>
                <div class="row">

                    @if (count($blogs) > 0)
                        @foreach ($blogs as $b)

                            <div class="col-12 col-md-6 col-lg-4">
                                <a href="/blog/{{ $b->slug }}">
                                    <div class="home_card">
                                        <div class="home_card_top">
                                            <img src="/img/default-blog.jpg" alt="image">
                                        </div>
                                        <div class="home_card_bottom">
                                            <div class="home_card_bottom_text">
                                                @if (count($b->cat) > 0)
                                                    <ul class="home_card_bottom_text_ul">
                                                        @foreach ($b->cat as $c)
                                                            <li>
                                                                <a href="/category/{{ $c->categoryName }}/{{ $c->id }}">{{ $c->categoryName }}</a>
                                                                <span><i class="fas fa-angle-right"></i></span>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                @endif


                                                <a href="/blog/{{ $b->slug }}">
                                                    <h2 class="home_card_h2">{{ $b->title }}</h2>
                                                </a>
                                                <p class="post_p">
                                                    {{ $b->post_excerpt }}
                                                </p>
                                                <div class="home_card_bottom_tym">
                                                    <div class="home_card_btm_left">
                                                        <img src="{{$b->user->profilePic}}" alt="image">
                                                    </div>
                                                    <div class="home_card_btm_r8">
                                                        <a href="contact_me.html">
                                                            <p class="author_name">{{ $b->user->fullName }}</p>
                                                        </a>
                                                        <ul class="home_card_btm_r8_ul">
                                                            <li>{{date('d-m-Y', strtotime($b->created_at))}}</li>
                                                            {{-- <li><span class="dot"></span>3 Min Read</li> --}}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    @endif
                </div>

              <div>  {{ $blogs->links() }} </div>

            </div>
        </div>

    </div>
    <!-- BODY -->
@endsection
