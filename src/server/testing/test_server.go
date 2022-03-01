package testing

import (
	"context"
	"net"
	"testing"

	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/health"
	"google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"
)

const (
	addr = "127.0.0.1:50051"
)

type TestServer struct {
	Server   *grpc.Server
	listener net.Listener
}

func (ts *TestServer) StartTestServer() {
	go func() {
		err := ts.Server.Serve(ts.listener)
		if err != nil {
			panic(err)
		}
	}()
}

func (ts *TestServer) AssertHealthy(t *testing.T) {
	hc := grpc_health_v1.NewHealthClient(Dialer())
	resp, err := hc.Check(context.Background(), &grpc_health_v1.HealthCheckRequest{})

	assert.Nil(t, err)
	assert.Equal(t, resp.Status, grpc_health_v1.HealthCheckResponse_SERVING)
}

func NewTestServer() *TestServer {
	l, err := net.Listen("tcp", addr)
	if err != nil {
		panic(err)
	}

	ts := TestServer{Server: grpc.NewServer()}
	reflection.Register(ts.Server)
	grpc_health_v1.RegisterHealthServer(ts.Server, health.NewServer())
	ts.listener = l

	return &ts
}

func Dialer() *grpc.ClientConn {
	cc, err := grpc.Dial(addr, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		panic(err)
	}
	return cc
}
