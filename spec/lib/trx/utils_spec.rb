require "spec_helper"

describe Trx::Utils do
  describe ".base58_decode_hex" do
    it "decodes a base58 encoded hex string" do
      hex_string = "T9zkAUDtszigAsHUJjwF9S81krzyMVoqQL"
      decoded = Trx::Utils.base58_decode_hex(hex_string)

      expect(decoded).to eq("41004a6dcce50b3845076ceebc10eb169d5859fa3a8d4c58f9")
    end

    it "decodes a base58 encoded hex string with prefix" do
      hex_string = "0xT9zkAUDtszigAsHUJjwF9S81krzyMVoqQL"
      decoded = Trx::Utils.base58_decode_hex(hex_string)

      expect(decoded).to eq("41004a6dcce50b3845076ceebc10eb169d5859fa3a8d4c58f9")
    end
  end

  describe ".base58_encode_hex" do
    it "encodes a hex string to base58" do
      hex_string = "41004a6dcce50b3845076ceebc10eb169d5859fa3a8d4c58f9"
      encoded = Trx::Utils.base58_encode_hex(hex_string)

      expect(encoded).to eq("T9zkAUDtszigAsHUJjwF9S81krzyMVoqQL")
    end

    it "encodes a hex string with prefix to base58" do
      hex_string = "0x41004a6dcce50b3845076ceebc10eb169d5859fa3a8d4c58f9"
      encoded = Trx::Utils.base58_encode_hex(hex_string)

      expect(encoded).to eq("T9zkAUDtszigAsHUJjwF9S81krzyMVoqQL")
    end
  end
end
