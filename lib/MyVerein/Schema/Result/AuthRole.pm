use utf8;
package MyVerein::Schema::Result::AuthRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyVerein::Schema::Result::AuthRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<auth_roles>

=cut

__PACKAGE__->table("auth_roles");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 role

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "role",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 auth_user_roles

Type: has_many

Related object: L<MyVerein::Schema::Result::AuthUserRole>

=cut

__PACKAGE__->has_many(
  "auth_user_roles",
  "MyVerein::Schema::Result::AuthUserRole",
  { "foreign.role_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: many_to_many

Composing rels: L</auth_user_roles> -> user

=cut

__PACKAGE__->many_to_many("users", "auth_user_roles", "user");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 22:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:I+wifmajxDre8ecfuW5pAQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
