#!/bin/sh

# `spring init --list` for details of dependencies
# activemq actuator amqp artemis azure-active-directory azure-cosmos-db azure-keyvault azure-storage azure-support
# batch cache camel cloud-bus cloud-cloudfoundry-discovery cloud-config-client cloud-config-server cloud-contract-stub-runner
# cloud-contract-verifier cloud-eureka cloud-eureka-server cloud-feign cloud-function cloud-gateway cloud-gcp
# cloud-gcp-pubsub cloud-gcp-storage cloud-loadbalancer cloud-resilience4j cloud-starter cloud-starter-consul-config
# cloud-starter-consul-discovery cloud-starter-vault-config cloud-starter-zookeeper-config cloud-starter-zookeeper-discovery
# cloud-stream cloud-task codecentric-spring-boot-admin-client codecentric-spring-boot-admin-server configuration-processor
# data-cassandra data-cassandra-reactive data-couchbase data-couchbase-reactive data-elasticsearch data-jdbc data-jpa
# data-ldap data-mongodb data-mongodb-reactive data-neo4j data-r2dbc data-redis data-redis-reactive data-rest data-rest-explorer
# datadog db2 derby devtools distributed-tracing docker-compose dynatrace flapdoodle-mongo flyway freemarker
# graphite graphql groovy-templates h2 hateoas hilla hsql influx integration jdbc jersey jooq kafka kafka-streams
# liquibase lombok mail mariadb modulith mustache mybatis mysql native new-relic oauth2-authorization-server oauth2-client
# oauth2-resource-server okta oracle picocli postgresql prometheus pulsar pulsar-reactive quartz restdocs rsocket
# scs-config-client scs-service-registry security sentry session solace spring-shell sqlserver testcontainers thymeleaf
# timefold-solver unboundid-ldap vaadin validation wavefront web web-services webflux websocket zipkin

dependencies="web,cloud-feign"

java_version="17"
boot_version="3.1.5"

# programming language 
# java or kotlin or groovy
language="java"

# jar or war
packaging="jar"

# maven or gradle
build="maven"

# use 'build' to only generate pom file
format="project"

group_id="org.github.aihua"
artifact_id="demo"
version="1.0.0"

package_name="org.github.aihua.demo"

# project name and description
name="cloud-feign"
description="Demo for Spring Cloud Feign"

# project unpacked if location is specified without an extension
location="cloud-feign"

spring init -d "${dependencies}" -j "${java_version}" -b "${boot_version}" \
    -l "${language}"  -p "${packaging}" \
    --build "${build}" --format "${format}"  \
    -g "${group_id}" -a "${artifact_id}" -v "${version}" \
    --package-name "${package_name}" -n "${name}" --description "${description}" \
    ${location}
