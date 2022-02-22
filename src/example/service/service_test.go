package service_test

import (
	pb "github.com/stabai/readysetgo/proto/example/service/v1"
	impl "github.com/stabai/readysetgo/src/example/service"
	serverTesting "github.com/stabai/readysetgo/src/server/testing"
	"os"
	"testing"
)

var (
	ts *serverTesting.TestServer
)

func setUp() {
	ts = serverTesting.NewTestServer()
	pb.RegisterExampleServiceServer(ts.Server, impl.NewExampleService())
	ts.StartTestServer()
	// foo
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