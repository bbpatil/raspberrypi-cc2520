
/**
 * Temporary hack to make BLIP work without modifications. This provides the
 * necessary CC2420 interface to make BLIP happy.
 *
 * When BLIP finally gets updated to use a generic IEEE15.4/Bare radio interface
 * this won't be necessary.
 */

configuration CC2420RadioC {
  provides {
    interface SplitControl;

 //   interface Resource[uint8_t clientId];
    interface Send as BareSend;
    interface Receive as BareReceive;
    interface Packet as BarePacket;

 //   interface Send    as ActiveSend;
 //   interface Receive as ActiveReceive;

 //   interface CC2420Packet;
    interface PacketAcknowledgements;
 //   interface LinkPacketMetadata;
 //   interface LowPowerListening;
    interface PacketLink;

  }
}
implementation {

  components CC2420RadioP;
  components CC2520RpiRadioC;

  CC2420RadioP.BareSend -> CC2520RpiRadioC.BareSend;
  CC2420RadioP.BareReceive -> CC2520RpiRadioC.BareReceive;

  SplitControl = CC2520RpiRadioC.SplitControl;
  BareSend = CC2420RadioP.Send;
  BareReceive = CC2420RadioP.Receive;
  BarePacket = CC2520RpiRadioC.BarePacket;

  PacketAcknowledgements = CC2520RpiRadioC.PacketAcknowledgements;
  PacketLink = CC2520RpiRadioC.PacketLink;

}