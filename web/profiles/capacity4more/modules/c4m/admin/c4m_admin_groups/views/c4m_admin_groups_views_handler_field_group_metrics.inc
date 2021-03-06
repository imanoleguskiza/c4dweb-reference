<?php
// @codingStandardsIgnoreFile

/**
 * @file
 *
 */

class c4m_admin_groups_views_handler_field_group_metrics extends c4m_admin_groups_views_handler_field {

  /**
   * @inheritdoc
   */
  function option_definition() {
    $options = parent::option_definition();

    $options['c4m_admin_groups_group_metric'] = array('default' => '');

    return $options;
  }

  /**
   * @inheritdoc
   */
  function options_form(&$form, &$form_state) {
    parent::options_form($form, $form_state);

    $list = c4m_helper_entity_metrics_info();
    if (count($list)) {
      $options = array('' => t('- None -'));

      foreach ($list as $key => $info) {
        $option_key = $info['context'] . '::' . $info['type'];
        $option_label = $info['type'] . ' (' . $info['context'] . ')';
        $options[$option_key] = $option_label;
      }

      $form['c4m_admin_groups_group_metric'] = array(
        '#type' => 'select',
        '#title' => t('Group metric'),
        '#description' => t('The metric of the group to be rendered.'),
        '#options' => $options,
        '#default_value' => $this->options['c4m_admin_groups_group_metric'],
        '#weight' => -200,
      );
    }
  }

  /**
   * @inheritdoc
   */
  function render($values) {
    $metric_key = $this->options['c4m_admin_groups_group_metric'];
    if (!empty($metric_key) && $group = $this->get_og_group_from_context($values)) {
      $og_id = $group->nid;
      return c4m_helper_entity_get_metrics($metric_key, $og_id, 'node');
    }
  }

}
