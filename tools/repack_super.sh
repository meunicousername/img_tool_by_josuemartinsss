system_a=`stat -c '%n %s' system_a_old.img`
system_a=${system_a#* }

cd .. && system_ext_a=`stat -c '%n %s' system_ext_a_old.img`
system_ext_a=${system_ext_a#* } && product_a=`stat -c '%n %s' product_a_old.img`
product_a=${product_a#* } && vendor_a=`stat -c '%n %s' vendor_a_old.img`
vendor_a=${vendor_a#* } && soma=$((system_a + system_ext_a + product_a + vendor_a)) && raw=`stat -c '%n %s' super_raw.img`
raw=${raw#* } && ./lpmake --metadata-size 65536 --super-name super --metadata-slots 2 --device super:$raw --group main:$soma --partition system_a:readonly:$system_a:main --image system_a=./system_a_old.img --partition system_ext_a:readonly:$system_ext_a:main --image system_ext_a=./system_ext_a_old.img --partition product_a:readonly:$product_a:main --image product_a=./product_a_old.img --partition vendor_a:readonly:$vendor_a:main --image vendor_a=./vendor_a_old.img --sparse --output ./super_new.img && rm super.img