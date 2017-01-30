=head1 shuffle

Shuffle a list of elements

=head2 SYNOPSIS

    &shuffle(6,9) # eq 3

=head2 Description

A Fisher–Yates shuffle of the elements of an array a.

=head2 USAGE

    @a = (1,2,3)
    &shuffle(@a)

=over 4

=item * @a the array to be shuffled.
=back

=cut

sub shuffle {
    my $len = scalar @_;
    my @a = @_;
    my $j = 0;
    for (my $i = $len-1; $i > 0; $i--) {
        $j = int(rand($i+1));
        @a[$i,$j]=@a[$j,$i];
    }
    return @a;
}
=head1 shuffle

Shuffle a list of elements

=head2 SYNOPSIS

    &shuffle(6,9) # eq 3

=head2 Description

A Fisher–Yates shuffle of the elements of an array a, stopping when n elements have been selected.

=head2 USAGE

    @a = (1,2,3)
    &shuffle(@a)

=over 4

=item * @a the array to be shuffled.
=back

=cut

sub nsubset {
    my $n = shift;
    my $len = scalar @_;
    my @a = @_;
    my $j = 0;
    for (my $i = $len-1; $i > $len-$n-1; $i--) {
        $j = int(rand($i+1));
        @a[$i,$j]=@a[$j,$i];
    }
    @r = @a[$len-$n .. $len-1];
    return @r;
}

# Tests
print "shuffle 1..5\n"; #1 to number of tests
srand 4;
print (scalar (&shuffle(1,2,3)) eq 3?"ok 1\n":"not ok 1\n");
print ((&shuffle(1,2,3))[0,1,2] eq (3,2,1)?"ok 2\n":"not ok 2\n");
print ((&shuffle(1,2,3))[0,1,2] eq (1,3,2)?"ok 3\n":"not ok 3\n");
print ((&shuffle(1,2,3))[0,1,2] eq (1,2,3)?"ok 4\n":"not ok 4\n");
print ((&shuffle('a','b',1))[0,1,2] eq (1,'a','b')?"ok 5\n":"not ok 5\n");

print "nsubset 1..7\n"; #1 to number of tests
srand 1;
@a = (1,2,3,4);
print (scalar(&nsubset(2,@a)) eq 2?"ok 1\n":"not ok 1\n");
print ((&nsubset(2,@a))[0,1] eq (2,4)?"ok 2\n":"not ok 2\n");
print ((&nsubset(2,@a))[0,1] eq (1,3)?"ok 3\n":"not ok 3\n");
print ((&nsubset(2,@a))[0,1] eq (3,1)?"ok 4\n":"not ok 4\n");
print (scalar(&nsubset(2,@a)) eq 2?"ok 5\n":"not ok 5\n");
print (scalar(&nsubset(3,@a)) eq 3?"ok 6\n":"not ok 6\n");
print (scalar(&nsubset(4,@a)) eq 4?"ok 7\n":"not ok 7\n");
