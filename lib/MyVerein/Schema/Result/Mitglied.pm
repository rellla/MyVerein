use utf8;
package MyVerein::Schema::Result::Mitglied;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyVerein::Schema::Result::Mitglied

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

=head1 TABLE: C<mitglied>

=cut

__PACKAGE__->table("mitglied");

=head1 ACCESSORS

=head2 mid

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 vorname

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 nachname

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 geburtstag

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 status

  data_type: 'tinyint'
  is_nullable: 0

=head2 geschlecht

  data_type: 'varchar'
  is_nullable: 0
  size: 1

=head2 firma

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 strasse

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ort

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hausnummer

  data_type: 'varchar'
  is_nullable: 0
  size: 4

=head2 eintritt

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 austritt

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 telefon

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 bemerkung

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 kontonr

  data_type: 'varchar'
  is_nullable: 1
  size: 11

=head2 blz

  data_type: 'varchar'
  is_nullable: 1
  size: 11

=head2 kreditinstitut

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 lastmodified

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "mid",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "vorname",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "nachname",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "geburtstag",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 0 },
  "status",
  { data_type => "tinyint", is_nullable => 0 },
  "geschlecht",
  { data_type => "varchar", is_nullable => 0, size => 1 },
  "firma",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "strasse",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "ort",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "hausnummer",
  { data_type => "varchar", is_nullable => 0, size => 4 },
  "eintritt",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "austritt",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "telefon",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "bemerkung",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "kontonr",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "blz",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "kreditinstitut",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "lastmodified",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</mid>

=back

=cut

__PACKAGE__->set_primary_key("mid");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 22:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ocl9aOzlzdOev5llUENf8w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
