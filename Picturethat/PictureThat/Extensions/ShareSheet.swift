//
//  ShareSheet.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/07.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    let title: String
    let image: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let activityItems = [title, image] as [Any]
        let shareViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return shareViewController
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
        // No need to update the view controller
    }
}

