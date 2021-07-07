<?php

namespace App\Providers;
use Illuminate\Support\ServiceProvider;
use App\Http\Controllers\BlogController;
use Illuminate\Support\Facades\View;
use Illuminate\Pagination\Paginator;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('partials.nav', BlogController::class);
        Paginator::useBootstrap();

    }
}
