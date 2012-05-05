class mirror (
  $mirror,
) {

  if ! ($operatingsystem in ['Ubuntu']) {
    fail("class does not support $operatingsystem")
  }

  class { 'apt':
    purge_sources_list   => true,
    purge_sources_list_d => true;
  }

  case $mirror {
    'cat': { include mirror::cat }
    'osl': { include mirror::osl }
    default: { fail("Module does not support '$mirror'") }
  }
}
