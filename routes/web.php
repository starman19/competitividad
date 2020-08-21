<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
//    return view('welcome');
 return redirect('admin');

});


Route::group(['prefix' => '/admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('wsproductos',"WebServices@productos")->name('wsproductos');
Route::get('wsofertas/{id}',"WebServices@ofertas")->name('wsofertas');
Route::get('wsoferta/{id}',"WebServices@getoferta")->name('wsoferta');
Route::get('wsmensaje/{id}/{txt}/{email}/{cel}',"WebServices@mensaje")->name('wsmensaje');


Route::resource('reportes','ReportController');
Route::get('reportes', 'ReportController@index')->name('reportes');

Route::post('reportes.parameters', 'ReportController@parameters')->name('parameters');
Route::post('reportes.generate', 'ReportController@generate')->name('generate');

