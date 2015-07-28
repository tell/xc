set -x

dirsname=('static-lib' 'shared-lib')
filename='config.h'
insert_code='#undef HAVE_LOCALECONV'

for d in ${dirsname[@]}; do
	pushd ${d}
	pwd
	[ -f ${filename} ] || { echo "Not found: ${filename}"; exit 1; }
	if grep -q "${insert_code}" ${filename}; then
		echo "Found inserted code."
	else
		echo "${insert_code}" >> ${filename}
	fi
	popd
done
