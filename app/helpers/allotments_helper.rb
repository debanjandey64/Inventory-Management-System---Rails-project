module AllotmentsHelper
  def get_deallotment_stats(allotment)
    if allotment.dealloted_at.nil?
      "** Currently alloted. **"
    else
      "Dealloted at : #{allotment.dealloted_at}"
    end
  end
end
