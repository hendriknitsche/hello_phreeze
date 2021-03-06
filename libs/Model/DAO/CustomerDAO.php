<?php
/** @package Phreeze.hendriknitsche.de::Model::DAO */

/** import supporting libraries */
require_once("verysimple/Phreeze/Phreezable.php");
require_once("CustomerMap.php");

/**
 * CustomerDAO provides object-oriented access to the customer table.  This
 * class is automatically generated by ClassBuilder.
 *
 * WARNING: THIS IS AN AUTO-GENERATED FILE
 *
 * This file should generally not be edited by hand except in special circumstances.
 * Add any custom business logic to the Model class which is extended from this DAO class.
 * Leaving this file alone will allow easy re-generation of all DAOs in the event of schema changes
 *
 * @package Phreeze.hendriknitsche.de::Model::DAO
 * @author ClassBuilder
 * @version 1.0
 */
class CustomerDAO extends Phreezable
{
	/** @var int */
	public $Id;

	/** @var string */
	public $Name;

	/** @var timestamp */
	public $LastLogin;

	/** @var string */
	public $Company;

	/** @var string */
	public $City;

	/** @var enum */
	public $Level;

	/** @var varbinary */
	public $Error;


	/**
	 * Returns a dataset of Package objects with matching CustomerId
	 * @param Criteria
	 * @return DataSet
	 */
	public function GetPackages($criteria = null)
	{
		return $this->_phreezer->GetOneToMany($this, "p_customer", $criteria);
	}


}
?>