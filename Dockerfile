FROM sonatype/nexus3:3.96.3

USER root

RUN curl -L "https://repo1.maven.org/maven2/org/sonatype/nexus/plugins/nexus-blobstore-google-cloud/3.96.3-02/nexus-blobstore-google-cloud-3.96.3-02-bundle.kar" -o /opt/sonatype/nexus/deploy/nexus-blobstore-google-cloud.kar

USER nexus