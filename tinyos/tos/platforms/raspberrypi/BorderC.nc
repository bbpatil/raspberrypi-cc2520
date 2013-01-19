
#define ROUTE_IFACE_BORDER 10

configuration BorderC {
}

implementation {
  components BorderP;
  components TunC;

  components MainC;
  MainC.SoftwareInit -> BorderP.SoftwareInit;

  components IPForwardingEngineP;
  IPForwardingEngineP.IPForward[ROUTE_IFACE_BORDER] -> TunC.IPForward;

  components IPStackC;
  BorderP.ForwardingTable -> IPStackC.ForwardingTable;
}
