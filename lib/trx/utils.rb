# frozen_string_literal: true

module Trx
  module Utils
    extend self

    def hex_to_bin(string)
      RLP::Utils.decode_hex remove_hex_prefix(string)
    end

    def bin_to_hex(bytes)
      RLP::Utils.encode_hex bytes
    end

    def remove_hex_prefix(string)
      string[0, 2] == "0x" ? string[2..-1] : string
    end

    def prefix_hex(hex)
      hex.match(/\A0x/) ? hex : "0x#{hex}"
    end

    def keccak256(value)
      Digest::Keccak.new(256).digest(value)
    end

    def base58check(value)
      sha256(sha256(value).digest)
    end

    def base58_decode_hex(hex)
      Base58.base58_to_binary(remove_hex_prefix(hex), :bitcoin).unpack1("H*")
    end

    def base58_encode_hex(string)
      Base58.binary_to_base58([remove_hex_prefix(string)].pack("H*"), :bitcoin)
    end

    def sha256(value)
      hash = OpenSSL::Digest.new("SHA256")
      hash.update(value)

      hash
    end

    def is_hex?(str)
      return false unless str.is_a? String

      str = remove_hex_prefix str
      str.match(/\A[0-9a-fA-F]*\z/)
    end
  end
end
