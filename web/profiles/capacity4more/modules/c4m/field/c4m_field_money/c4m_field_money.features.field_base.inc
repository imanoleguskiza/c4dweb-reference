<?php
/**
 * @file
 * c4m_field_money.features.field_base.inc
 */

/**
 * Implements hook_field_default_field_bases().
 */
function c4m_field_money_field_default_field_bases() {
  $field_bases = array();

  // Exported field_base: 'c4m_money'.
  $field_bases['c4m_money'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'c4m_money',
    'indexes' => array(),
    'locked' => 0,
    'module' => 'money',
    'settings' => array(
      'max' => 999999999999999.99,
      'min' => 0,
      'precision' => 16,
      'scale' => 2,
    ),
    'translatable' => 0,
    'type' => 'money',
  );

  return $field_bases;
}
