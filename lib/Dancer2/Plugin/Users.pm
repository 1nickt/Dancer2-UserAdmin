package Dancer2::Plugin::Users;

our $VERSION = '0.9903';

use Dancer2::Plugin;
use Dancer2::Plugin::DBIC;

plugin_keywords(qw/
    user_create
/);

1; # return true

=head1 NAME

Dancer2::Plugin::Users - Administration of registered users

=head1 DESCRIPTION

This Dancer2 plugin provides registered user management tools.

=head1 CONFIGURATION

=cut

