# install_flask.pp

# Ensure the pip3 package is installed
package { 'python3-pip':
  ensure => installed,
}

# Use the pip provider to install Flask version 2.1.0
pip { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}
