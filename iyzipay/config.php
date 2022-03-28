<?php

require_once('IyzipayBootstrap.php');

IyzipayBootstrap::init();

class Config
{
    public static function options()
    {
        $options = new \Iyzipay\Options();
        $options->setApiKey('apıkey');
        $options->setSecretKey('Secretkey');
        $options->setBaseUrl('https://sandbox-api.iyzipay.com');
        return $options;
    }
}
