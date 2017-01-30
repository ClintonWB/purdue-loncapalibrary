=head1 gcd

Take the GCD of a list of elements

=head2 SYNOPSIS

    &gcd(6,9) # eq 3
    &gcd(-5,30,125, 0) # eq 5  

=head2 Description

Given any positive number of integers, returns the greatest common divisor.

=head2 USAGE

    &gcd(a,b,[c,d,...])

=over 4

=item * 
=back

=cut

sub gcd {
    my $b = abs(shift);
    for (my $i=0; $i<scalar(@_);$i++ ) {
        $a = abs(shift);
        ($a,$b) = ($b,$a) if $a > $b;
        while ($a) {($a, $b) = ($b%$a,$a);}
    }
    return $b;
}

# Tests
print "gcd 1..9\n"; #1 to number of tests
print &gcd(1,2,3) eq 1 ? "ok 1\n" : "not ok 1\n";
print &gcd(4,6,2) eq 2 ? "ok 2\n" : "not ok 2\n";
print &gcd(1,0) eq 1 ? "ok 3\n" : "not ok 2\n";
print &gcd(2,0) eq 2 ? "ok 4\n" : "not ok 4\n";
print &gcd(-2,0) eq 2 ? "ok 4\n" : "not ok 4\n";
print &gcd(12,18,24) eq 6 ? "ok 5\n" : "not ok 5\n";
print &gcd(24,18,12) eq 6 ? "ok 6\n" : "not ok 6\n";
print &gcd(2,4,6,8) eq 2  ? "ok 7\n" : "not ok 7\n";
print &gcd(3,-6,9,-15) eq 3 ? "ok 8\n" : "not ok 8\n";
print &gcd(1) eq 1 ? "ok 9\n" : "not ok 9\n";
