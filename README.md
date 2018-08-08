# VHDL Quick-Start Templates!
Templates for most common VHDL components, ex: state machines, basic components, test benchs, etc. Quickly get started while following a style guide recommended by Xilinx

## Templates
### State Machine
Templates can be used for both Moore or Mealy finite state machines (FSMs).
> Finite State Machines (FSM) are sequential circuit used in many digital systems to control the behavior of
> systems and dataflow paths. Examples of FSM include control units and sequencers. -Xilinx

[State Machine Template](./Templates/state_machine.vhdl)

### Asynchronous Entity

[Asynchronous Entity](./Templates/entity_async.vhdl)

### Synchronous Entity

[Synchronous Entity](./Templates/entity_sync.vhdl)

### Entity Using Combinational Process

[Entity With Combinational Process](./Templates/entity_combination.vhdl)

### Testbench

[Testbench](./Templates/testbench.vhdl)

## Example Files

[Clock Frequency Divider](./Examples/freq_divide.vhdl)

## Full-Scale Implementation
I have used the example files as a demonstration of what a complete digital design could look like. I will walk you through the following components and will explain how they all work together.<br>
_Note: this is not a tutorial but rather a walkthrough of an example of a complete digital design_

**State Machine**: Central control unit for the digital system<br>
**Transmitter**: Transmitter Unit<br>
**Receiver**: Receiver Unit<br>
**Frequency Divider**: Divide central clock frequency for use with the transmitter and receiver units<br>
**Timer**: Timer used for state change in the state machine<br>

**CURRENTLY WRITING**
