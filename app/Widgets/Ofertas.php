<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Ofertas extends AbstractWidget
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
        $count = \App\Oferta::count();
        $string = trans_choice('voyager::dimmer.user', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-receipt',
            'title'  => "Ofertas registradas",
            'text'   => 'Registre la oferta de sus productos. Actualmente hay '.$count.' Oferta(s) registradas',
            'button' => [
                'text' => 'Registre sus ofertas',
                'link' => route('voyager.ofertas.index'),
            ],
            'image' => '/images/gastos.jpg',
        ]));
    }
  public function shouldBeDisplayed()
    {
        return true;
    }

}
