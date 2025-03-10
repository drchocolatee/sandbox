cd /mnt/data00 && \
#wget https://archive.apache.org/dist/nifi/1.21.0/nifi-1.21.0-bin.zip && \
#wget https://archive.apache.org/dist/nifi/1.21.0/nifi-toolkit-1.21.0-bin.zip && \
unzip nifi-toolkit-1.21.0-bin.zip && \
unzip nifi-1.21.0-bin.zip && \
systemctl stop nifi && \
sh /mnt/data00/nifi-1.20.0/bin/nifi.sh stop && \
cp -vp /mnt/data00/nifi-1.20.0/conf/flow.xml.gz /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/bootstrap.conf /mnt/data00/nifi-1.21.0/conf/bootstrap.conf_orig && \
cp -vp /mnt/data00/nifi-1.20.0/conf/bootstrap.conf /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/nifi.properties /mnt/data00/nifi-1.21.0/conf/nifi.properties_orig && \
cp -vp /mnt/data00/nifi-1.20.0/conf/nifi.properties /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/zookeeper.properties /mnt/data00/nifi-1.21.0/conf/zookeeper.properties_orig && \
cp -vp /mnt/data00/nifi-1.20.0/conf/zookeeper.properties /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/logback.xml /mnt/data00/nifi-1.21.0/conf/logback.xml_orig && \
cp -vp /mnt/data00/nifi-1.20.0/conf/logback.xml /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/state-management.xml /mnt/data00/nifi-1.21.0/conf/state-management.xml_orig && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/state-management.xml /mnt/data00/nifi-1.21.0/conf/ && \
#mv -v /mnt/data00/nifi-1.21.0/conf/bootstrap-notification-services.xml /mnt/data00/nifi-1.21.0/conf/bootstrap-notification-services.xml_orig && \
#cp /mnt/data00/nifi-1.12.1/conf/bootstrap-notification-services.xml /mnt/data00/nifi-1.15.2/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/authorizers.xml /mnt/data00/nifi-1.21.0/conf/authorizers.xml_orig && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/authorizers.xml /mnt/data00/nifi-1.21.0/conf/ && \
mv -v /mnt/data00/nifi-1.21.0/conf/login-identity-providers.xml /mnt/data00/nifi-1.21.0/conf/login-identity-providers.xml_orig && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/login-identity-providers.xml /mnt/data00/nifi-1.21.0/conf/ && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/truststore.jks /mnt/data00/nifi-1.21.0/conf/ && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/keystore.jks /mnt/data00/nifi-1.21.0/conf/ && \
cp -vpf /mnt/data00/nifi-1.20.0/conf/variable-registry.properties /mnt/data00/nifi-1.21.0/conf/ && \
ln -snvf /mnt/data00/nifi-1.21.0 nifi_current && \
ln -snvf /mnt/data00/nifi-toolkit-1.21.0 nifi-toolkit_current && \
chown -R --reference=nifi-1.20.0 nifi-toolkit_current && \
chown -R --reference=nifi-1.20.0 nifi-toolkit-1.21.0 && \
chown -R --reference=nifi-1.20.0 nifi-1.21.0 && \
chown -R --reference=nifi-1.20.0 nifi_current && \
cd /opt && \
ln -svfn /mnt/data00/nifi-1.21.0 nifi && \
ln -snvf /mnt/data00/nifi-toolkit-1.21.0 nifi-toolkit_current && \
chown -R --reference=nifi-certs nifi && \
chown -R --reference=nifi-certs nifi-toolkit_current && \
sudo sh /opt/nifi/bin/nifi.sh restart && tail -F /opt/nifi/logs/nifi-app.log