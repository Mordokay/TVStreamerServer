//
//  SongController.swift
//  
//
//  Created by Pedro Saldanha on 28/09/2022.
//

import Fluent
import Vapor

struct SongController: RouteCollection {
  func boot(routes: Vapor.RoutesBuilder) throws {
    let songs = routes.grouped("songs")
    songs.get(use: index)
    songs.post(use: create)
  }

  func index(req: Request) throws -> EventLoopFuture<[Song]> {
    return Song.query(on: req.db).all()
  }

  func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    let song = try req.content.decode(Song.self)
    return song.save(on: req.db).transform(to: .ok)
  }
}
