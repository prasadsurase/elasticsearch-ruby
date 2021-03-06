require 'test_helper'

module Elasticsearch
  module Test
    class XPackSecurityGetUserPrivilegesTest < Minitest::Test

      context "XPack Security: Get user privileges" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal "_xpack/security/user/_privileges", url
            assert_equal Hash.new, params
            assert_equal nil, body
            true
          end.returns(FakeResponse.new)

          subject.xpack.security.get_user_privileges
        end

      end

    end
  end
end
