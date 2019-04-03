//
//  udp.swift
//  udp
//
//  Created by leigh mclean on 9/1/19.
//  Copyright © 2019 roughidea. All rights reserved.
//

import Foundation

///
/// UDP Reader Errors
///

enum ReaderUDPError : Error {
    case getAddrInfo(error: Int32)
    case socket(error: Int32)
    case bind(error: Int32)
    case read(error: Int)
    case unknown
}

///
/// ReaderUDP
///

class ReaderUDP : Reader {
    
    private var connectionHandle: Int32
    
    ///
    /// ReaderUDP Init
    ///
    /// - parameters:
    ///   - port: The port number to listen to e.g. 5606 for pcars udp
    ///
    
    init(port: String) throws {
        
        self.connectionHandle = -1
        
        // Create addrinfo struct
        var hints = addrinfo(
            ai_flags: AI_PASSIVE,
            ai_family: AF_UNSPEC,
            ai_socktype: SOCK_DGRAM,
            ai_protocol: 0,
            ai_addrlen: 0,
            ai_canonname: nil,
            ai_addr: nil,
            ai_next: nil)
        
        // Store server infos
        var serverInfo: UnsafeMutablePointer<addrinfo>? = nil
        
        // Get list of server infos
        var status = getaddrinfo(
            nil,
            port,
            &hints,
            &serverInfo)
        defer {
            freeaddrinfo(serverInfo)
        }
        
        guard status == 0 else {
            throw ReaderUDPError.getAddrInfo(error: status)
        }
        
        var info = serverInfo
        var weHaveAConnection = false
        var functionNameThatReturnedError = ""
        var errorCode: Int32 = 0
        
        // loop through servinfo list of remote address info
        while info != nil && !weHaveAConnection{
            
            // Create connection handle
            self.connectionHandle = socket(
                info!.pointee.ai_family,
                info!.pointee.ai_socktype,
                info!.pointee.ai_protocol)
            
            if self.connectionHandle != -1 {
                // Bind socket to address
                status = bind(
                    self.connectionHandle,
                    info!.pointee.ai_addr,
                    info!.pointee.ai_addrlen)
                
                if status == 0 {
                    weHaveAConnection = true
                }
                else {
                    errorCode = errno
                    functionNameThatReturnedError = "bind"
                    info = info!.pointee.ai_next
                }
            }
            else {
                functionNameThatReturnedError = "socket"
                errorCode = self.connectionHandle
                info = info!.pointee.ai_next
            }
        }
        
        guard weHaveAConnection else {
            if functionNameThatReturnedError == "socket" {
                throw ReaderUDPError.socket(error: errorCode)
            }
            else if functionNameThatReturnedError == "bind" {
                throw ReaderUDPError.bind(error: errorCode)
            }
            else {
                throw ReaderUDPError.unknown
            }
        }
    }
    
    ///
    /// ReaderUDP deinit
    ///
    
    deinit {
        close(self.connectionHandle)
    }
    
    ///
    /// ReaderUDP read: Reads data from UDP
    ///
    ///
    /// - parameters:
    ///   - amount: amount to be read
    /// - returns:
    ///   - Data: read
    ///
    
    public func read(amount : Int) -> (Data) {
        
        let theirAddr: UnsafeMutablePointer<sockaddr>? = nil
        let theirAddrLen: UnsafeMutablePointer<socklen_t>? = nil
        
        // use peeked at packet size to initialise array
        //let requestBuffer: Array<UInt8> = Array(repeating: 0, count: amount)
        let buffer : UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(byteCount: amount, alignment: 1)
        defer {
            buffer.deallocate()
        }
        
        // now grab the packet
        let amountRead = recvfrom(self.connectionHandle, buffer,
                                  amount, 0,
                                  theirAddr,
                                  theirAddrLen)
        
        guard amountRead >= 0 else {
            return Data()
        }
        
        let returnbuf : Data = Data(bytesNoCopy: buffer, count: amountRead, deallocator: .none)
        
        
        return (returnbuf)
    }
}
