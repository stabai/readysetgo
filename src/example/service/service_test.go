package service_test

import (
	"os"
	"testing"

	pb "github.com/stabai/readysetgo/proto/example/service/v1"
	impl "github.com/stabai/readysetgo/src/example/service"
	serverTesting "github.com/stabai/readysetgo/src/server/testing"
)

var (
	ts *serverTesting.TestServer
)

func setUp() {
	ts = serverTesting.NewTestServer()
	pb.RegisterExampleServiceServer(ts.Server, impl.NewExampleService())
	ts.StartTestServer()
}

func tearDown() {
	ts.Server.GracefulStop()
}

func TestMain(m *testing.M) {
	setUp()
	code := m.Run()
	tearDown()
	os.Exit(code)
}

func TestServer_StartsAndIsHealthy(t *testing.T) {
	ts.AssertHealthy(t)
}
