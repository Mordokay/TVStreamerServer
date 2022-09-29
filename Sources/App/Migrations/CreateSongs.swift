//
//  CreateSongs.swift
//  
//
//  Created by Pedro Saldanha on 28/09/2022.
//

import Fluent

struct CreateSongs: Migration {
  func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
    return database.schema("songs")
      .id()
      .field("title", .string, .required)
      .create()
  }

  func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
    return database.schema("songs").delete()
  }


}
