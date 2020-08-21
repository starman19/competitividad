<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Veredas extends AbstractWidget
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
        $count = \App\Vereda::count();
        $string = trans_choice('voyager::dimmer.user', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-images',
            'title'  => $count." Veredas",
            'text'   => 'Actualmente hay '.$count." veredas registradas. Haga click en el boton para ver",
            'button' => [
                'text' => 'Ver veredas',
                'link' => route('voyager.veredas.index'),
            ],
            'image' => '/images/lotes.jpg',
        ]));
    }
  public function shouldBeDisplayed()
    {
        return true;
    }

}
