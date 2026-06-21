# Amazon ElastiCache

Managed in-memory caching — Redis and Memcached engines. Sits in front of your database to absorb read traffic and reduce latency from milliseconds to microseconds.

## Why Use a Cache?

- Database reads are slow relative to memory reads
- Repeated queries for the same data waste DB resources
- Cache stores results in memory → subsequent requests served from cache, not DB
- Reduces DB load, lowers latency, improves throughput

## Redis vs Memcached — Choose One

| Feature | Redis | Memcached |
|---------|-------|-----------|
| Data persistence | ✓ (RDB snapshots, AOF) | ✗ |
| Replication | ✓ (primary + replicas) | ✗ |
| Multi-AZ failover | ✓ | ✗ |
| Data structures | Strings, hashes, lists, sets, sorted sets, bitmaps, HyperLogLog, streams | Strings only |
| Pub/Sub | ✓ | ✗ |
| Lua scripting | ✓ | ✗ |
| Multi-threaded | ✗ (single-threaded per shard) | ✓ |
| Horizontal scaling | ✓ (Cluster Mode) | ✓ (native sharding) |
| Backup/restore | ✓ | ✗ |

> **Rule of thumb:** If you need persistence, replication, HA, or advanced data structures → **Redis**. If you need simple, multi-threaded, pure caching at scale → **Memcached**.

## Redis Architecture

### Cluster Mode Disabled
```
Primary node  ←→  Read Replica 1
                  Read Replica 2  (up to 5)
```
- Single shard — all data on one primary
- Read replicas for read scaling
- Multi-AZ with automatic failover
- Max data size = single node memory

### Cluster Mode Enabled
```
Shard 1: Primary + replicas  (keyspace slot 0–5460)
Shard 2: Primary + replicas  (keyspace slot 5461–10922)
Shard 3: Primary + replicas  (keyspace slot 10923–16383)
```
- Data partitioned across multiple shards (up to 500)
- Each shard has its own primary + replicas
- Horizontal write scaling — distribute writes across shards
- Use when: dataset exceeds single node memory, or you need write throughput scaling

## Redis Global Datastore

- Replicates a Redis cluster across up to **3 AWS regions**
- Primary cluster (read/write) + secondary clusters (read-only)
- < 1 second replication lag
- Use for: low-latency reads globally, cross-region DR for cache

## Caching Strategies

### Lazy Loading (Cache-Aside)
```
App → check cache → HIT: return data
                  → MISS: query DB → write to cache → return data
```
- Cache only what's requested
- **Pros:** cache never fills with unused data
- **Cons:** cache miss = 3 round trips; stale data possible (TTL mitigates)

### Write-Through
```
App → write to DB → immediately write to cache
```
- Cache always has fresh data
- **Pros:** no stale data
- **Cons:** cache fills with data that may never be read; write penalty

### Write-Behind (Write-Back)
```
App → write to cache → async write to DB later
```
- Fastest write path
- **Pros:** lowest write latency
- **Cons:** risk of data loss if cache fails before DB write completes

### TTL (Time to Live)
- Set expiry on cache keys — stale data auto-evicted
- Balance between freshness and cache hit rate
- Always use TTL with lazy loading to prevent indefinitely stale data

## Eviction Policies

When cache is full, ElastiCache evicts keys based on the configured policy:

| Policy | Behavior |
|--------|----------|
| `allkeys-lru` | Evict least recently used keys from all keys |
| `volatile-lru` | Evict LRU from keys with TTL set |
| `allkeys-lfu` | Evict least frequently used keys |
| `volatile-lfu` | Evict LFU from keys with TTL set |
| `volatile-ttl` | Evict keys with shortest TTL first |
| `noeviction` | Return error when memory full (default) |

## Common Use Cases

| Use Case | Engine | Pattern |
|----------|--------|---------|
| **Database query caching** | Redis or Memcached | Lazy loading |
| **Session store** | Redis | Key-value with TTL |
| **Leaderboards / rankings** | Redis | Sorted sets (ZADD/ZRANGE) |
| **Rate limiting** | Redis | Atomic increment + TTL |
| **Pub/Sub messaging** | Redis | PUBLISH/SUBSCRIBE |
| **Real-time analytics** | Redis | HyperLogLog, Streams |
| **API response caching** | Redis or Memcached | Lazy loading |
| **Distributed locking** | Redis | SETNX + TTL |

## ElastiCache for Redis vs DynamoDB DAX

| Factor | ElastiCache (Redis) | DynamoDB DAX |
|--------|---------------------|--------------|
| Works with | Any DB (RDS, Aurora, etc.) | DynamoDB only |
| API | Redis API | DynamoDB API (drop-in) |
| Data structures | Rich (sorted sets, streams, etc.) | Key-value only |
| Persistence | Optional | No |
| Use when | General-purpose caching | DynamoDB read acceleration |

## Security

- Deploy in **VPC private subnets** — no public internet access
- **Security Groups** — control access from application layer
- **Encryption at rest** — KMS (Redis only)
- **Encryption in transit** — TLS (Redis only)
- **Redis AUTH** — password authentication; or use IAM auth (newer)
- Memcached does not support encryption — avoid for sensitive data

## Exam Tips

- **Redis = HA, persistence, complex data types** — almost always the right answer unless the question specifically needs multi-threaded simplicity
- Cluster Mode Enabled = horizontal write scaling; Disabled = single shard, read replicas only
- Lazy loading = cache miss penalty (3 trips); write-through = no stale data but wasted cache space
- Session store questions → ElastiCache Redis (not DynamoDB, unless question specifies DAX)
- DAX = DynamoDB only; ElastiCache = any backend
- "Reduce DB load from read-heavy workload" → ElastiCache in front of RDS/Aurora
- Memcached has **no replication, no persistence, no failover** — pure horizontal cache

## Study Notes

<!-- Fill in your notes here -->
