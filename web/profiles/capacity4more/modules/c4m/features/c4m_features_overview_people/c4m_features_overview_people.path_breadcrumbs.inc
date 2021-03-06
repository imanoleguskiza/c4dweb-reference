<?php

/**
 * @file
 * c4m_features_overview_people.path_breadcrumbs.inc
 */

/**
 * Implements hook_path_breadcrumbs_settings_info().
 */
function c4m_features_overview_people_path_breadcrumbs_settings_info() {
  $export = array();

  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'people';
  $path_breadcrumb->name = 'People';
  $path_breadcrumb->path = 'people';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'People',
    ),
    'paths' => array(
      0 => '<none>',
    ),
    'home' => 0,
    'translatable' => 0,
    'arguments' => array(),
    'access' => array(),
  );
  $path_breadcrumb->weight = -95;
  $export['people'] = $path_breadcrumb;

  return $export;
}
