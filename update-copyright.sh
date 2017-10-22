## UPDATE-COPYRIGHT.SH

# 1.
# Updates copyright for Will to the current year.

YEAR=`date +%Y`
sed -i'.tmp' 's/\(2006\)-[0-9]* /\1-'$YEAR' /' COPYRIGHT
rm COPYRIGHT.tmp

for ii in *.ins *.tex *.ltx *.dtx ; do

echo $ii

# 2.
# Updates copyright statements between lines surrounded by:
#    % /©
#.   ...
#.   % ©/
# with the text in the file COPYRIGHT

awk 'FNR==NR{ _[++d]=$0;next}
/^% \/©$/{
  print
  for(i=1;i<=d;i++){ print _[i] }
  f=1;next
}
/^% ©\/$/{f=0}!f' COPYRIGHT $ii > tmpfile

mv tmpfile $ii

# 3.
# Updates the first line of the file to match the filename

sed -i'.tmp' "1s/.*/%%^^J%%  $ii  -  part of UNICODE-MATH \<github.com\/wspr\/unicode-math\>/" $ii

rm $ii.tmp

done

