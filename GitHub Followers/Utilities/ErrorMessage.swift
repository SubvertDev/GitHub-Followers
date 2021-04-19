//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by Subvert on 18.04.2021.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete this request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Data recieved from the server is invalid. Please try again."
}
