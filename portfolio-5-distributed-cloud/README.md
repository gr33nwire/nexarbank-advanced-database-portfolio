# Portfolio 5: Distributed and Cloud Database

## 1. Introduction
This exercise demonstrates the deployment of NexarBank's database using MongoDB Atlas, a cloud-hosted database platform. The objective is to examine distributed database concepts, including replication, availability, consistency, and scalability.

## 2. Deployment Configuration
NexarBank's NoSQL database was deployed on MongoDB Atlas with the following configuration:

- **Database:** `nexarbank_nosql`
- **Cluster:** Cluster0
- **Cloud provider:** AWS
- **Region:** Paris, `eu-west-3`
- **Cluster tier:** Free
- **Topology:** Three-node replica set
- **MongoDB version:** 8.0.37

The replica set consists of one Primary node and two Secondary nodes.

## 3. Replication
MongoDB replica sets maintain copies of data across multiple database nodes.

In this deployment:
- The Primary node handles database write operations.
- The two Secondary nodes replicate data from the Primary using MongoDB's replication mechanism.
- If the Primary becomes unavailable, the replica set can elect another eligible member as Primary.

The Atlas dashboard confirmed the presence of three replica-set members. However, a controlled failover test was not performed.

## 4. Availability
Replication supports database availability by providing additional members that may take over following a Primary node failure.

This improves resilience compared with relying on a single database server. Actual availability depends on node health, network connectivity, and successful replica-set elections.

## 5. Consistency
MongoDB provides configurable read and write concerns to control consistency and acknowledgement behaviour.

For a banking application such as NexarBank, majority write acknowledgement and appropriate read settings would be important when handling financial transactions. These settings were discussed as design considerations but were not configured or tested as part of this exercise.

## 6. Sharding and Scalability
Sharding distributes data across multiple shards to support horizontal scaling when database size or workload increases.

Sharding was not implemented in this exercise. The current deployment uses a three-node replica set, which provides replication rather than sharding. A sharded deployment could be considered if NexarBank's transaction volume and storage requirements grow.

## 7. Limitations
- The deployment uses MongoDB Atlas Free Tier.
- Backup status was shown as inactive in the Atlas dashboard.
- No controlled failover test was conducted.
- Sharding was not configured.
- The exercise demonstrates cloud deployment and replica-set topology, not a production-ready banking architecture.

## 8. Evidence
The `evidence` folder contains screenshots of:
1. MongoDB Atlas replica-set overview.
2. Replica-set member metrics.
3. NexarBank customer documents in Atlas Data Explorer.
4. Atlas deployment configuration showing the three-node replica set.

## 9. Conclusion
The exercise demonstrated how MongoDB Atlas can host NexarBank's NoSQL database in a cloud environment using a three-node replica set. It provided practical exposure to distributed database deployment and the concepts of replication, availability, consistency, and horizontal scalability.

The deployment also highlighted areas requiring further work, particularly backup configuration, failover testing, and scalability planning.
