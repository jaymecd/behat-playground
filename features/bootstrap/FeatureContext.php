<?php

use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Mink\Exception\UnsupportedDriverActionException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @BeforeStep
     */
    public function maximizeWindow()
    {
        try {
            $this->getSession()->maximizeWindow();
        } catch (UnsupportedDriverActionException $e) {
            // nothing
        }
    }
}
