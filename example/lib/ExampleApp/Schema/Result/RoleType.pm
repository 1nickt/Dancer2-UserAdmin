use utf8;
package ExampleApp::Schema::Result::RoleType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExampleApp::Schema::Result::RoleType

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<role_type>

=cut

__PACKAGE__->table("role_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 16

=head2 nice_name

  data_type: 'varchar'
  default_value: null
  is_nullable: 0
  size: 32

=head2 description

  data_type: 'text'
  default_value: null
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 16,
  },
  "nice_name",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 0,
    size => 32,
  },
  "description",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_unique>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name_unique", ["name"]);

=head2 C<nice_name_unique>

=over 4

=item * L</nice_name>

=back

=cut

__PACKAGE__->add_unique_constraint("nice_name_unique", ["nice_name"]);

=head1 RELATIONS

=head2 roles

Type: has_many

Related object: L<ExampleApp::Schema::Result::Role>

=cut

__PACKAGE__->has_many(
  "roles",
  "ExampleApp::Schema::Result::Role",
  { "foreign.type_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-17 21:21:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WM9GsQ2kMgoBelmt4gK2LA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
