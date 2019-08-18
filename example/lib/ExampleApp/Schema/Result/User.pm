use utf8;
package ExampleApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExampleApp::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: null
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 16

=head2 email

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 128

=head2 status

  data_type: 'varchar'
  default_value: 'pending'
  is_nullable: 0
  size: 16

=head2 first_name

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 16

=head2 last_name

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 16

=head2 created_at

  data_type: 'datetime'
  default_value: current_timestamp
  is_nullable: 0

=head2 modified_at

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 passphrase

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 48

=head2 change_password

  data_type: 'boolean'
  default_value: 0
  is_nullable: 0

=head2 is_test

  data_type: 'boolean'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    default_value     => \"null",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "username",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 16,
  },
  "email",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 128,
  },
  "status",
  {
    data_type => "varchar",
    default_value => "pending",
    is_nullable => 0,
    size => 16,
  },
  "first_name",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 16,
  },
  "last_name",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 16,
  },
  "created_at",
  {
    data_type     => "datetime",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "modified_at",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "passphrase",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 48,
  },
  "change_password",
  { data_type => "boolean", default_value => 0, is_nullable => 0 },
  "is_test",
  { data_type => "boolean", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<email_unique>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("email_unique", ["email"]);

=head2 C<username_unique>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("username_unique", ["username"]);

=head1 RELATIONS

=head2 memberships

Type: has_many

Related object: L<ExampleApp::Schema::Result::Membership>

=cut

__PACKAGE__->has_many(
  "memberships",
  "ExampleApp::Schema::Result::Membership",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-17 21:21:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0gB+Bz3P2svFeUNP91A32A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
