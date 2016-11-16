Networking: NIC Bonding
=======================

## Bond Types/Modes

### Mode Numbers

| Mode | Description         |
|:-----|:--------------------|
| 0    | Balance Round Robin |
| 1    | Active backup       |
| 2    | Balance XOR         |
| 3    | Broadcast           |
| 4    | 802.3ad             |
| 5    | Balance TLB         |
| 6    | Balance ALB         |

### Descriptions

__Mode 0 (balance-rr)__
> This mode transmits packets in a sequential order from the first available slave through the last. If two real interfaces are slaves in the bond and two packets arrive destined out of the bonded interface the first will be transmitted on the first slave and the second frame will be transmitted on the second slave. The third packet will be sent on the first and so on. This provides load balancing and fault tolerance.

__Mode 1 (active-backup)__
> This mode places one of the interfaces into a backup state and will only make it active if the link is lost by the active interface. Only one slave in the bond is active at an instance of time. A different slave becomes active only when the active slave fails. This mode provides fault tolerance.

__Mode 2 (balance-xor)__
> Transmits based on XOR formula. (Source MAC address is XOR’d with destination MAC address) modula slave count. This selects the same slave for each destination MAC address and provides load balancing and fault tolerance.

__Mode 3 (broadcast)__
> This mode transmits everything on all slave interfaces. This mode is least used (only for specific purpose) and provides only fault tolerance.

__Mode 4 (802.3ad)__
> This mode is known as Dynamic Link Aggregation mode. It creates aggregation groups that share the same speed and duplex settings. This mode requires a switch that supports IEEE 802.3ad Dynamic link. Slave selection for outgoing traffic is done according to the transmit hash policy, which may be changed from the default simple XOR policy via the xmit_hash_policy option. Note that not all transmit policies may be 802.3ad compliant, particularly inregards to the packet mis-ordering requirements of section 43.2.4 of the 802.3ad standard. Differing peer implementations will have varying tolerances for noncompliance.

__Mode 5 (balance-tlb)__
> This is called as Adaptive transmit load balancing. The outgoing traffic is distributed according to the current load and queue on each slave interface. Incoming traffic is received by the current slave.

__Mode 6 (balance-alb)__
> This is Adaptive load balancing mode. This includes balance-tlb + receive load balancing (rlb) for IPV4 traffic. The receive load balancing is achieved by ARP negotiation. The bonding driver intercepts the ARP Replies sent by the server on their way out and overwrites the src hw address with the unique hw address of one of the slaves in the bond such that different clients use different hw addresses for the server.

----
[Source](
[Source](http://www.cloudibee.com/network-bonding-modes/))









## Articles

[Linux Network Bonding - Setup Guide](http://www.cloudibee.com/network-bonding-modes/)
