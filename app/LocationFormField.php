<?php

namespace App;


use TCG\Voyager\FormFields\AbstractHandler;

class LocationFormField extends AbstractHandler
{
    protected $codename = 'location';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.location', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent
        ]);
    }
}
