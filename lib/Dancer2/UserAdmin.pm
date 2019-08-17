package Dancer2::UserAdmin;

our $VERSION = '0.9902';

use Moo;

1; # return true

=head1 NAME

Dancer2::UserAdmin - Administration for registered users and site memberships

=head1 DESCRIPTION

This package provides user administration for your Dancer2 app. Create and
manage users, grant user roles, add time-limited renewable memberships to
the site, and use those properties for content access, communications, etc.

The user object is available throughout your application code, and the user's
memberships (if you have implemented that feature) are available as sub-objects.
The package makes use of C<DBIx::Class> to create the objects from your database.

You can choose to use only the Users administration plugin, or both. The
Memberships plugin cannot be used without the Users plugin.

=head1 CONFIGURATION

=cut

