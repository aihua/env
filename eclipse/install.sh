#!/bin/bash

dist_version="4.5"
install_root="/opt/install/eclipse/$dist_version"
eclipse_root="/opt/eclipse"
#eclipse_root="/mnt/temp/eclipse"
dropins_root="$eclipse_root/eclipse/dropins"

tar -C $eclipse_root -zxvf $install_root/eclipse-platform-$dist_version-linux-gtk-x86_64.tar.gz
#unzip $install_root/eclipse-platform-4.3.1-win32.zip -d $eclipse_root

function mkdir_with_eclipse () {
	if [ ! -z "$1" ] ; then 
		mkdir -p $dropins_root/$1/eclipse
	fi
}

function handle_artifact () {
	if [ ! -z "$1" ] ; then 
		if [ -f $dropins_root/$artifact/eclipse/artifacts.jar ] ; then
			rm $dropins_root/$artifact/eclipse/artifacts.jar
		fi

		if [ -f $dropins_root/$artifact/eclipse/content.jar ] ; then
			rm $dropins_root/$artifact/eclipse/content.jar
		fi

		if [ -f $dropins_root/$artifact/eclipse/site.xml ] ; then
			rm $dropins_root/$artifact/eclipse/site.xml
		fi

		if [ -d $dropins_root/$artifact/eclipse/META-INF ] ; then
			rm -fr $dropins_root/$artifact/eclipse/META-INF
		fi

		if [ -d $dropins_root/$artifact/eclipse/binary ] ; then
			cp $dropins_root/$artifact/eclipse/binary/* $eclipse_root/eclipse/p2/org.eclipse.equinox.p2.core/cache/binary/
		fi
	fi
}

declare -A artifact_files
artifact_files['jdt']="org.eclipse.jdt-${dist_version}.zip"
artifact_files['pde']="org.eclipse.pde-${dist_version}.zip"
artifact_files['graphti']="org.eclipse.graphiti.site_0.12.0.201506030807.zip"
artifact_files['cdt']="cdt-8.7.0.zip"
artifact_files['wtp']="wtp-repo-R-3.7.0-20150609111814.zip"
artifact_files['wb']="WB_v1.8.0_UpdateSite_for_Eclipse4.5.zip"
artifact_files['pydev']="PyDev-4.3.0.zip"
artifact_files['pdt']="pdt-Update-3.5.0.201506101710.zip"
artifact_files['adt']="ADT-23.0.6.zip"

artifact_files['emf']="emf-runtime-2.11.0.zip"
artifact_files['emf-transaction']="emf-transaction-runtime-1.9.0.zip"
artifact_files['emf-validation']="emf-validation-runtime-1.9.0.zip"
artifact_files['xsd']="xsd-runtime-2.11.0.zip"
artifact_files['gef']="GEF-ALL-3.10.0.zip"
artifact_files['dtp']="dtp-p2repo_1.12.0.zip"
artifact_files['birt']="birt-report-framework-4.5.0-20150609.zip"

artifact_files['spket']="spket-1.6.23.zip"

artifacts="jdt pde dtp graphti cdt wtp wb pydev pdt adt"
for artifact in $artifacts ; do
	mkdir_with_eclipse $artifact
	unzip $install_root/${artifact_files[$artifact]} -d $dropins_root/$artifact/eclipse
	handle_artifact $artifact
done

artifacts="emf emf-transaction emf-validation xsd gef birt spket"

for artifact in $artifacts ; do
	mkdir -p $dropins_root/$artifact
	unzip $install_root/${artifact_files[$artifact]} -d $dropins_root/$artifact
	handle_artifact $artifact
done

#mkdir_with_eclipse pdt
#unzip $install_root/pdt-Update-3.5.0.201506101710.zip -d $dropins_root/pdt
#mv $dropins_root/pdt/3.5.0/plugins $dropins_root/pdt/eclipse/
#mv $dropins_root/pdt/3.5.0/features $dropins_root/pdt/eclipse/
#rm -fr $dropins_root/pdt/3.5.0

mv $eclipse_root/eclipse $eclipse_root/$dist_version
