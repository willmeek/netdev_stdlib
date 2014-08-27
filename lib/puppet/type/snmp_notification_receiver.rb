# encoding: utf-8

Puppet::Type.newtype(:snmp_notification_receiver) do
  @doc = 'Manage an SNMP notification receiver'

  ensurable

  newparam(:name, namevar: true) do
    desc 'Hostname or IP address of the receiver'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:type) do
    desc 'The type of receiver [traps|informs]'
    newvalues(:traps, :informs)
  end

  newproperty(:version) do
    desc 'SNMP version [v1|v2|v3]'
    newvalues(:v1, :v2, :v3)
  end

  newproperty(:username) do
    desc 'Username to use for SNMPv3 privacy and authentication'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:security) do
    desc 'SNMPv3 security mode'
    newvalues(:auth, :noauth, :priv)
  end

  newproperty(:port) do
    desc 'SNMP UDP port number'
    munge { |v| Integer(v) }
  end

  newproperty(:community) do
    desc 'SNMPv1 and v2 community string'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:vrf) do
    desc 'Interface to send SNMP data from, e.g. "management"'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:source_interface) do
    desc 'Source interface to send SNMP data from, e.g. "ethernet 2/1"'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end
end
