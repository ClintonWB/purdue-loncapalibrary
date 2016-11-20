=head1 texsum

Format a sum of elements, dropping +-1 coefficients and 0 terms appropriately 

=head2 SYNOPSIS

    &texsum([1,2,0,4],['a','b','c']) # eq 'a+2b+4'

=head2 USAGE

    &texsum(\@coeffs, \@basis)

Given an array reference to a list of numerical coefficients,
and an array reference to a list of string summands,
formats the string for display in a tex field.

=cut

sub texsum(\@\@) {
    my $coeffs = $_[0];
    my $basis = $_[1];
    
    my $sumstring = '';
    my $length = $#{$coeffs};

    my $leading = 1; #Set true until a nonzero coefficient is found 
    for (my $i = 0; $i <= $length; $i++){
        my $coeff = ${$coeffs}[$i];
        if ($coeff != 0) {
            if ($coeff > 0 && !$leading){
                $sumstring = $sumstring . "+";
            }
            $leading = 0;
            if (!defined ${$basis}[$i] || ${$basis}[i] eq ''){
                $sumstring = $sumstring . $coeff;
            }
            else {
                if ($coeff == -1) {
                    $sumstring = $sumstring . '-';
                }
                elsif ($coeff != 1) {
                    $sumstring = $sumstring . $coeff;
                }
                $sumstring = $sumstring . ${$basis}[$i];
            }
        }
    }
    #If there is no nonzero coefficient, there has been no leading coefficient;
    if ($leading) {
        $sumstring = '0';
    }
    return $sumstring;
}

=head1 texpoly

A polynomial formatter for LonCapa

=head2 SYNOPSIS
    
    &texpoly([1,0,@a,@b],'y')
    &texpoly([@a,-1,0,@b])

=head2 USAGE

    &texpoly(\@coeffs, $base)

Takes an array reference to a list of numerical coefficients
in decreasing order of degree,
and the (optional) variable of the single-variable polynomial,
returns LaTeX for the polynomial.

=cut

sub texpoly(\@;$) {
    my $coeffs = $_[0];
    my $base = $_[1];
    my $basis;
    if (!defined $base) {
        $base = 'x';
    }
    if ($#{$coeffs} > 0){
        $basis = [map {"$base^{$_}"} reverse 2..$#{$coeffs}];
        push(@$basis,"$base");
    }
    return &texsum($coeffs,$basis);
}

# Tests
print "texsum 1..7\n"; #1 to number of tests
print &texsum([1],['a']) eq 'a' ? "ok 1\n" : "not ok 1\n";
print &texsum([-1],['a']) eq '-a' ? "ok 2\n" : "not ok 2\n";
print &texsum([2],['a']) eq '2a' ? "ok 3\n" : "not ok 2\n";
print &texsum([2,1],['a']) eq '2a+1' ? "ok 4\n" : "not ok 4\n";
print &texsum([2,-1],['a']) eq '2a-1' ? "ok 5\n" : "not ok 5\n";
print &texsum([2,-4],['a']) eq '2a-4' ? "ok 6\n" : "not ok 6\n";
print &texsum([-5..5],['a','b','c','d']) eq "-5a-4b-3c-2d-1+1+2+3+4+5" ? "ok 7\n" : "not ok 7\n";;

print "texpoly 1..8\n";
print &texpoly([1]) eq '1' ? "ok 1\n" : "not ok 1\n";
print &texpoly([1],'y') eq '1' ? "ok 2\n" : "not ok 2\n";
print &texpoly([1,-1]) eq 'x-1' ? "ok 3\n" : "not ok 3\n";
print &texpoly([1,-1],'y') eq 'y-1' ? "ok 4\n" : "not ok 4\n";
print &texpoly([2,1]) eq '2x+1' ? "ok 5\n" : "not ok 5\n";
print &texpoly([-2,1]) eq '-2x+1' ? "ok 6\n" : "not ok 6\n";
print &texpoly([-1..3]) eq '-x^{4}+x^{2}+2x+3' ? "ok 7\n" : "not ok 7\n";
print &texpoly([-1..3],'z') eq '-z^{4}+z^{2}+2z+3' ? "ok 8\n" : "not ok 8\n";
