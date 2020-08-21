<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Variedades extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\Producto::count();
        $string = trans_choice('voyager::dimmer.user', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-tree',
            'title'  => $count." Productos",
            'text'   => 'Actualmente hay '.$count." productos registrados. Haga click en el boton para verlos",
            'button' => [
                'text' => 'Ver productos',
                'link' => route('voyager.productos.index'),
            ],
            'image' => '/images/variedades.jpg',
        ]));
    }
  public function shouldBeDisplayed()
    {
        return true;
    }

}
