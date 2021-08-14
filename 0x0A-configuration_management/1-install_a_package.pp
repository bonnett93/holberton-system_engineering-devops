# Install puppet-lint.
node default {
package{'puppet-lint':
  ensure  => '2.1.1'}
}
