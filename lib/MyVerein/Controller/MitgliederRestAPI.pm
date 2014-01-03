package MyVerein::Controller::MitgliederRestAPI;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::REST'; }

__PACKAGE__->config(default => 'application/json');

=head1 NAME

MyVerein::Controller::MitgliederRestAPI - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub grid : Local ActionClass('REST') {}

sub grid_POST {
    my ($self, $c) = @_;

    my ($page, $search_by, $search_text, $rows, $sort_by, $sort_order) =
        @{ $c->req->params }{qw/page qtype query rp sortname sortorder/};

    s/\W*(\w+).*/$1/ for $sort_by, $sort_order, $search_by; # sql injections bad

    my %data;

    my $rs = $c->model('MyVereinDB::Mitglied')->search({}, {
        order_by => "$sort_by $sort_order",
    });

    $rs = $rs->search_literal("lower($search_by) LIKE ?", lc($search_text))
        if $search_by && $search_text;

    my $paged_rs = $rs->search({}, {
        page => $page,
        rows => $rows,
    });

    $data{total} = $rs->count;
    $data{page}  = $page;
    $data{rows}  = [
        map { +{
            id => $_->mid,
            cell => [
                $_->mid,
                $_->nachname,
                $_->vorname,
                $_->strasse,
                $_->hausnummer,
                $_->ort,
                $_->geburtstag."",
           ]
        } } $paged_rs->all
    ];

# Workaround to regex the given DateTime from MySQL into readable format.
# TODO: Try to figure out, why $_->geburtstag->dmy('.') isn't working as expected.
    for (my $i=0; $i<$data{total}; $i++) {
        $data{rows}[$i]{cell}[6] =~ s/(\d{4})-(\d{2})-(\d{2})T\d{2}:\d{2}:\d{2}/$3.$2.$1/;
    }
# Workaround End

    $self->status_ok($c, entity => \%data);
}


=encoding utf8

=head1 AUTHOR

,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
