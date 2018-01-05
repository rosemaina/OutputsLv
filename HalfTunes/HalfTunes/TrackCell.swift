import UIKit

protocol TrackCellDelegate {
  
  func pauseTapped(_ cell: TrackCell)
  func resumeTapped(_ cell: TrackCell)
  func cancelTapped(_ cell: TrackCell)
  func downloadTapped(_ cell: TrackCell)
}

class TrackCell: UITableViewCell {
  
  var delegate: TrackCellDelegate?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var progressLabel: UILabel!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var downloadButton: UIButton!
  
  @IBAction func pauseOrResumeTapped(_ sender: AnyObject) {
    
    if(pauseButton.titleLabel!.text == "Pause") {
      
      delegate?.pauseTapped(self)
    }
    else {
      delegate?.resumeTapped(self)
    }
  }
  
  @IBAction func cancelTapped(_ sender: AnyObject) {
    delegate?.cancelTapped(self)
  }
  
  @IBAction func downloadTapped(_ sender: AnyObject) {
    delegate?.downloadTapped(self)
  }
  
  func configure(track: Track, download: Download?, downloaded: Bool) {
    
    // Configure title and artist labels
    titleLabel.text = track.trackName
    artistLabel.text = track.artistName
    
    var showDownloadControls = false
    if let download = download {
      
      showDownloadControls = true
      progressLabel.text = download.isDownloading ? "Downloading..." : "Paused"
      let title = download.isDownloading ? "Pause" : "Resume"
      pauseButton.setTitle(title, for: .normal)
    }

    // If the track is already downloaded, enable cell selection and hide the Download button
    selectionStyle = downloaded ? UITableViewCellSelectionStyle.gray : UITableViewCellSelectionStyle.none
    downloadButton.isHidden = downloaded || showDownloadControls
    pauseButton.isHidden = !showDownloadControls
    cancelButton.isHidden = !showDownloadControls
  }
  
}
