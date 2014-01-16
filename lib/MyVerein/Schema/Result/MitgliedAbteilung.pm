use utf8;
package MyVerein::Schema::Result::MitgliedAbteilung;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyVerein::Schema::Result::MitgliedAbteilung

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

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<mitglied_abteilung>

=cut

__PACKAGE__->table("mitglied_abteilung");

=head1 ACCESSORS

=head2 mitglied

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 abteilung

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 lastmodified

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "mitglied",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "abteilung",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
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

=item * L</mitglied>

=item * L</abteilung>

=back

=cut

__PACKAGE__->set_primary_key("mitglied", "abteilung");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-16 21:36:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ULZu70mOLb3VUY91VP6cFg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
