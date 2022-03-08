peer chaincode query -C mychannel -n fabcar -c '{"Args":["queryAllCars"]}'

peer chaincode query -C mychannel -n fabcar -c '{"function":"queryCar","Args":["CAR0"]}'

peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n fabcar -c '{"function":"changeCarOwner","Args":["CAR0","Andre Felipe"]}' --waitForEvent --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt

peer chaincode install -n fabcar2 -v 2.0 -p github.com/chaincode/fabcar/go/

peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n fabcar2 -v 2.0 -c '{"Args":["init"]}'

peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n fabcar2 -c '{"function":"createCar","Args":["CAR11","Volkswagen","Brasília","Amarela","Mamonas","1995"]}' --waitForEvent --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt